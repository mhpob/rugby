library(xml2); library(pagedown)

# Create all of the URLS
grid <- combn(1:9, 2)
URLS <- sprintf('https://www.enneagraminstitute.com/relationship-type-%s-with-type-%s',
                c(grid[1,], 1:9),
                c(grid[2,], 1:9))

URLS <- c(URLS,
          'https://www.enneagraminstitute.com/interpreting-your-enneagram-test-results/',
          'https://www.enneagraminstitute.com/misidentifications-of-enneagram-personality-types/',
          'https://www.enneagraminstitute.com/how-the-enneagram-system-works/')

# There is an annoying "accept cookies?" dialog that I can't seem to get rid of.
#   So, instead of going straight to pagedown::chrome_print, I am first removing the
#   scripts from the files, which includes the popup
for(url in URLS){
  current_page <- read_html(url)
  
  current_page |> 
    xml_find_all('//script') |> 
    xml_remove()
  
  html_filename <- paste(basename(url), 'html', sep = '.')
  
  current_page |> 
    write_html(html_filename)
  
  chrome_print(html_filename)
  
  file.remove(html_filename)
}
