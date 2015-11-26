FactoryGirl.define do
   factory :dog do
    	name "Fluffy"
    	email "fluffster@aol.com"     
		password "testtest"
		password_confirmation "testtest"     
		birthday Time.now-3.years 
		city "New York" 
		state "NY"
		newsletter true 
    end

    factory :invalid_dog, class: Dog do
    	name "Fluffy"
    	email nil     
		password "testtest"
		password_confirmation "testtest"     
		birthday Time.now-3.years 
		city "New York" 
		state "NY"
		newsletter true 
	end

	factory :updated_dog, class: Dog do
    	name "Scruffy"
    	email "scruffster@aol.com"     
		password "testtest"
		password_confirmation "testtest"     
		birthday Time.now-3.years 
		city "New York" 
		state "NY"
		newsletter true 
	end
end