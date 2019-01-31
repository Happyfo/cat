class StudentInfosController < ApplicationController
    before_action :set_student_info, only: [:edit, :update, :show, :destroy]

    def new
        @student_info = Student_info.new()
    end

    def create
        @student_info = Student_info.new(student_info_params)
        if @student_info.save

            flash[:notice] = "Student info created successfully!"
            redirect_to student_info_path(@student_info) 
        else
            render 'new'
        end
    end

    def show
    end

    def index
        @student_infos = Student_info.all
    end

    def edit
       
    end

    def update
        if @student_info.update(student_info_params)
            flash[:notice] ="Student info updated successfully!"
            redirect_to todo_path(@student_info)
        else
            render 'edit'
        end
    end

    def destroy
        @student_info.destroy
        flash[:notice]  = "Student info Deleted successfully"
        redirect_to student_infos_path
    end
    
    private

    def set_student_info
        @student_info = Student_info.find(params[:id])
    end
    


    def student_info_params
        params.require(:student_info).permit(:name, :description, :time)
    end
    
end
end
