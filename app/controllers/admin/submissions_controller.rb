class Admin::SubmissionsController < ApplicationController
  
 def index
   @submissions = Submission.all
 end
 
 def show
 end
 
 def destroy
 end
 
end
