class UsersTestsController < BasesController
  def create
    user_test = UsersTest.new(user_id: current_user.id, test_id: params[:test_id], accessor: :student)
    if user_test.save
      flash[:notice] = 'Registered Successfully'
    else
      flash[:alert] = 'Registration failed'
    end
    redirect_to dashboards_path
  end
end
