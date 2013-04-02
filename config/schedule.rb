every 5.hours do
  command "ctags -R /Users/tawheedabdul-raheem/2013/Rails/who_cares/."
end

every 5.hours do
  command "rm -rf /Users/tawheedabdul-raheem/2013/Rails/who_cares/tags"
  command "mv tags /Users/tawheedabdul-raheem/2013/Rails/who_cares/"
end
