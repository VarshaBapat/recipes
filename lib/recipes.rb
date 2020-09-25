require_relative 'dispatch'

# 1. Show a prompt to the user with a list of options
# 2. If the command == 'quit', then exit the program
# 3. Otherwise, if `list`, then show the list of recipes in the databse
# 4. If `show {identifier}`, then show the specific recipe
# 5. If `delete {identifier}`, then remove the specific recipe from the database
# 6. If `new`, then: show a empty form, then
#    save the form's data to the database
# 7. If `edit`, then: show a form prepopulated with the receipe, then
#    update the existing recipe in the database
# 8. Go back to step 1

begin
  print 'Enter your command (list, show, new, edit, delete, quit): '
  input = gets.chomp.downcase.strip.split(' ')
  command, params = input
  dispatch command, params
end until ['quit', 'q'].include? command
