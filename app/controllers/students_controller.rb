class StudentsController < ApplicationController
  class StudentInfosController < ApplicationController
    before_action :set_student, only: [:edit, :update, :show, :destroy]

    def new
        @student_info = Student.new()
    end

    def create
        @student_info = Student.new(student_params)
        if @student.save

            flash[:notice] = "Student info created successfully!"
            redirect_to student_info_path(@student) 
        else
            render 'new'
        end
    end

    def show
    end

    def index
        @students = Student.all
    end

    def edit
       
    end

    def update
        if @student.update(student_params)
            flash[:notice] ="Student info updated successfully!"
            redirect_to student_path(@student)
        else
            render 'edit'
        end
    end

    def destroy
        @student.destroy
        flash[:notice]  = "Student info Deleted successfully"
        redirect_to students_path
    end
    
    private

    def set_student
        @student = Student.find(params[:id])
    end
    


    def student_params
        params.require(:student).permit(:name, :description, :time)
    end
    
end
end
  
end
