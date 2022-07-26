
# https://usarugby.sportlomo.com/wp-admin/admin-ajax.php?action=clubMapData

library(rvest); library(httr); library(dplyr)

# Import roster
lros <- POST('https://usarugby.sportlomo.com/wp-admin/admin-ajax.php?action=clubMapData',
             body = list(
               id = 11149,
               fetchValues = 'Provincal', # yes, this "should be" misspelled
               defaultLabel = 'Region'
             ),
             encode = 'form') 
lro <- lros %>% 
  content() %>% 
  html_element('body') %>% 
  html_element('p')  %>% 
  html_elements('option')

name <- lro %>% html_text(trim = T)
name <- gsub('club_contents.*|[ \t]{2}|[\\"\\,]|\\\\n|}', '', name)

values <- lro %>% html_attr('value')
values <- gsub('[\\"\\\\]', '', values)

lro <- tibble(name = name, value = values)[-1, ]

lro_registrations <- lapply(
  lro$value,
  function(x){
    tryCatch({
      url <- paste0(
        'https://usarugby.sportlomo.com/wp-admin/admin-ajax.php?action=getClubMembers&id=',
        x
      )
      
      read_html(url) %>% 
        html_table(header = T) %>% 
        .[[1]]
    },
    error = function(e) e
    )
  })

errs <- sapply(lro_registrations, function(x) any(class(x) == 'error'))

lro_registrations <- lro_registrations[!errs]

errs <- sapply(lro_registrations, function(x) nrow(x) == 0)

lro_registrations <- lro_registrations[!errs]

lro_registrations <- bind_rows(lro_registrations)


# write.csv(lro_registrations %>% distinct(Region), 'lros.csv')
pathways <- read.csv('lros.csv')

referees <- lro_registrations %>% 
  mutate_at(vars(matches('Name')), tolower) %>% 
  group_by(Region, Category) %>% 
  distinct(`First Name`, `Last Name`, .keep_all = T) %>% 
  left_join(pathways)

Nrefs_order <- referees %>% 
  group_by(Region) %>% 
  tally() %>% 
  arrange(-n)

Nrefs <- referees %>% 
  group_by(Region, Category) %>% 
  tally() %>% 
  mutate(Region = factor(Region, ordered = T, levels = rev(Nrefs_order$Region)))

library(ggplot2)

ggplot(data = Nrefs) +
  geom_col(aes(x = Region, y = n, fill = Category)) +
  geom_label(aes(x = Region, y = n, label = n), alpha = 0.5) +
  scale_fill_viridis_d(option = 'C') +
  coord_flip() +
  theme_minimal() +
  theme(
    # axis.text.y = element_text(color = ifelse(
    #                                  grepl('Potomac|New England|New York|Penn|Virginia',
    #                                        rev(Nrefs_order$Region)), 'red', 'black')),
    axis.text.y = element_text(color = ifelse(
      grepl('Potomac|Penn|Virginia',
            rev(Nrefs_order$Region)), 'red', 'black')),
        axis.text = element_text(size = 12),
        axis.title = element_blank(),
        legend.position = c(0.9, 0.7))

Nrefs <- referees %>% 
  group_by(Pathways) %>%
  tally() %>% 
  arrange(rev(Pathways))

ggplot(data = Nrefs, aes(x = '',  y = n, fill = Pathways)) +
  geom_bar(stat = 'identity') +
  coord_polar('y', start = 0) +
  scale_fill_viridis_d(option = 'C', na.value = 'lightgray') +
  geom_text(aes(label = scales::percent(n/sum(n), accuracy = 1),
                y = 7 + n/4 + c(0, cumsum(n)[-length(n)])),
            size = 25/.pt) +
  labs(fill = '') +
  theme_void() +
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        legend.text = element_text(size = 26))

referees |> 
  filter(grepl('Potomac|Penn|Virginia', Region)) |> 
  tally() |> 
  ungroup() |> 
  summarize(sum(n))

