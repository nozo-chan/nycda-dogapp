require 'rails_helper'

RSpec.describe DogsController, :type => :controller do

	let(:valid_attributes) { 
		@valid_attributes = {
			name: "Fluffy", email: "fluffster@aol.com",     
			password: "testtest", password_confirmation: "testtest",     
			birthday: Time.now-3.years, 
			city: "New York", 
			state: "NY",newsletter: true  
		} 
	}

 let(:update_attributes) { 
        @update_attributes = {
            name: "Scruffy", email: "scruffster@aol.com",     
            password: "testtest", password_confirmation: "testtest",     
            birthday: Time.now-3.years, 
            city: "New York", 
            state: "NY",newsletter: true  
            } 
        }

	let(:email_invalid_attributes) { 
		@email_invalid_attributes = {
			name: "Fluffy", email:  nil,     
			password: "testtest", password_confirmation: "testtest",     
			birthday: Time.now-3.years, 
			city: "New York", 
			state: "NY",newsletter: true  
		} 
	}

	let(:valid_session) { {dog_id: 1} }
	

	describe "GET index" do    
		it "assigns all dogs as @dogs" do   
			dog = Dog.create! valid_attributes  
			get :index, {}, valid_session     
			expect(assigns(:dogs)).to eq([dog])   
		end 
	end

	
	describe "GET show" do  
		it "assigns the requested dog as @dog" do 
			dog= Dog.create! valid_attributes
			get :show, {id: 1}, valid_session
			expect(assigns(:dog)).to eq(dog)
		end
	end

	describe "GET new" do  
		it "assigns a new dog as @dog" do 
			# use get to call the 'new' action with no params
			get :new, {}
			# we expect the variable @dog to be an instance of dog 
			expect(assigns(:dog)).to be_an_instance_of(Dog)

		end 
	end

	describe "GET edit" do  
		it "assigns the requested dog as @dog" do  
			dog= Dog.create! valid_attributes
			get :edit, {id: 1}, valid_session
			expect(assigns(:dog)).to eq(dog)   
		end 

	end 
	describe "DELETE destroy" do  
		it "destroys the requested dog" do 
			#create specific dog 
			dog= Dog.create! valid_attributes
			# run destroy action
			delete :destroy, {id: 1}, valid_session
			# make sure dog is nil
			expect(Dog.all).to eq([])
		end
		it "redirects to the dogs list" do 
			dog= Dog.create! valid_attributes
			delete :destroy, {id: 1}, valid_session
			expect(response).to redirect_to dogs_path
		end 
	end

	describe " POST create" do 

		context " valid_attributes" do 
			it " check that @dog is assigned" do 
				dog = Dog.create! valid_attributes
				post :create, {dog:valid_attributes}, valid_session
				expect(assigns(:dog)).to be_an_instance_of(Dog)
			end

			it " check that @dog is saved to db" do 
				post :create, {dog:valid_attributes}, valid_session
				expect(Dog.all.count).to eq(1)
			end

			it " check that page is redirected to @dog" do 
				post :create, {dog: valid_attributes}, valid_session
				expect(response).to redirect_to (assigns(:dog))
			end 	
		end

		context " invalid_attributes" do 

			it " check that @dog is assigned" do 
				post :create, {dog: email_invalid_attributes}, valid_session
				 expect(assigns(:dog)).to be_an_instance_of(Dog)
			end 

			it " check that page is redirected to create a new dog" do 
					post :create, {dog: email_invalid_attributes}, valid_session
					expect(response).to render_template(:new)
			end 
		end 
	end 


describe " PATCH update " do 

        context " valid_attributes" do 
            it " check that @dog is assigned" do 
                #create a dog
                #
                dog = Dog.create! valid_attributes
                #send new data to the update action along with dog's 
                # id we want to change
                #
                patch :update, {id: dog.id, dog:update_attributes}, valid_session
                #ensure that the variable in the update action is assigned 
                # the same information as the dog we created in the test
                #
                expect(assigns(:dog)).to eq(dog)
            end
        end
    end





end
