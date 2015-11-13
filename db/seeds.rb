# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
locations = [
'Bernal Heights',
'Castro',
'Chinatown',
'Dogpatch',
'Embarcadero',
'Excelsior',
'Financial District',
'Glen Park',
'Haight',
'Hayes Valley',
'Marina',
'Mission',
'Mission Bay',
'Nob Hill',
'Noe Valley',
'North Beach',
'Pacific Heights',
'Potrero Hill',
'Richmond',
'Russian Hill',
'Tenderloin'
]

locations.each do |name|
	Location.create(name: name)
end