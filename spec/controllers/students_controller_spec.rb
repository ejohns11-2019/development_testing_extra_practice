require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:valid_attributes) {
    { name: "Bob Ross", gpa: 433, student_number: 76}
  }

  let(:invalid_attributes) {
    { name: "", gpa: 433, student_number: 76}
  }

  describe "GET #index" do
    if "returns http success" do
      get:index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      student = @school.students.create! valid_attributes
      get :show, params; { id: student.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      student = @school.students.create! valid_attributes
      get :edit, params: { id: student.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create " do
    context "with valid params" do
      it "creates a new Student" do
        expect {
          post :create, params: {student: valid_attributes}
        }.to change(Student, :count).by(1)
      end

      it "redirect to the created student" do
        post :create, params: {student: valid_attributes}
        expect(response).to redirect_to(Student.last)
      end
    end

    context "with invalid params" do
      it "does not create a new student" do
        expect {
          post :create, params: {student: invalid_attributes}
        }.to change(Student, :count).by(0)
      end

      it "returns a success response ie. to display new form" do
        post :create, params: {student: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {gpa: 600 }
      }

      it "updates the requested student" do
        student = @schoo.students.create! valid_attributes
        put :update, params {id: student.id, student: new_attributes}
        student.reload
        expect(student.gpa).to eq(new_attributes[:gpa])
      end

      it "redirect to the student" do
        student = @school.students.create! valid_attributes
        put :update, params: {id: student.id, student: valid_attributes}
        expect(response).to redirect_to(student)
      end
    end

    context "with invalid params" do
      it 'does not update the student' do
        student = @school.students.create! valid_attributes
        put :update, params: {id: student.id, student: invalid_attributes}
        student.reload
        expect(student.name).to_not eq(invalid_attributes[:name])
      end

      it "returns a success response ie. to displa edit form" do
        student = @school.student.create! valid_attributes
        put :update, params: {id: student.id, student: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested student" do
      student = @school.students.create! valid_attributes
      expect {
        delete :destroy, params: { id: student.id }
      }.to change(Student, :count).by(-1)
    end

    it "redirect to the students list" do
      student = @school.students.create! valid_attributes
      delete :destroy, params: { id: student.id }
      expect(response).to redirect_to(students_url)
    end
  end
end
