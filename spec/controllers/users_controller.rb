class UsersController < Application
	layout 'main'
	get do
		erb 'index'
	end
	post do
		@user = User.create(params[:user])
		erb 'show'
	end
	get ':id' do
		@user = User.find(params[:id])
		erb 'show'
	end
	put ':id' do
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])
		erb 'show'
	end
	delete ':id' do
		@user = User.find(params[:id])
		@user.destroy
	  halt 200
	end
end