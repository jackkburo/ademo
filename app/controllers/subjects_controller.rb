class SubjectsController < ApplicationController
  
  layout 'admin'
    
    def index
      list  
      render('list')
    end

    def list
      @subject = Subject.order("subjects.position ASC")
    end
    
    def show
      @subject = Subject.find(params[:id])
    end
    
    def new
      @subject = Subject.new
      @subject_count = Subject.count + 1
    end
    
    def create
      @subject = Subject.new(params[:subject])
      #save the object
      if @subject.save
        flash[:notice] = "Successfully created..."
        redirect_to(:action  => 'list')
        
      else
        @subject_count = Subject.count
        render('new')
      end
    end

    def edit
      @subject = Subject.find(params[:id])
      @subject_count = Subject.count
    end
    
    def update
      # find object using form parameteres
       @subject = Subject.find(params[:id])
       # update the object
       if @subject.update_attributes(params[:subject])
         flash[:notice] = "Successfully updated..."
          redirect_to(:action  => 'show', :id  => @subject.id)  
        else
          @subject_count = Subject.count
          render('edit')
        end
    end
    
    def delete
      @subject = Subject.find(params[:id])
      
    end
    
    def destroy
      Subject.find(params[:id]).destroy
      flash[:notice] = "Successfully destroy..."    
      redirect_to(:action => 'list')
    end

end
