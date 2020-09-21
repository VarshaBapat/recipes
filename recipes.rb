require_relative 'dispatch'

# STEP 1: Show a prompt to the user with a list of options 
# If the command == 'quit', then exit the program
# Otherwise,
# If `list`, then show the list of recipes in the databse
# If `show {identifier}`, then show the specific recipe
# If `delete {identifier}`, then remove the specific recipe from the database
# If `new`, then:
#   show a empty form, then
#   save the form's data to the database
# If `edit`, then:
#   show a form prepopulated with the receipe, then
#   update the existing recipe in the database
# Go back to step 1 

begin
    print 'Enter your command (list, show, new, edit, delete, quit): '
    input = gets.chomp.downcase.strip.split(' ')
    command, params = input
    dispatch command, params
end until ['quit', 'q'].include? command