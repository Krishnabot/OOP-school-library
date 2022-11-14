require_relative 'app'
def main
app = App.new
app.run
end

def app_options = [
'[0]  =>  List all Books',
'[1]  =>  List all People',
'[2]  =>  List all Students',
'[3]  =>  List all Teachers',
'[4]  =>  Create a Person',
'[5]  =>  Create a Book',
'[6]  =>  Create a Rental',
'[7]  =>  List all Rentals for a given Person',
'[8]  =>  List all Rentals for a given Book',
'[9]  =>  Exit'    
]
main
