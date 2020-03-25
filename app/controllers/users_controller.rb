class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def sign_in
    user=User.find_by(username: params[:username])

    if user && user.password
      render json: {username: user.username, id: user.id}
    else
      render json: {message: "Invalid username/password"}
    end

  end
  

  # POST
  def weekly_budget

    user=User.find_by(params[:id])
    total_income_by_monthly=user.incomes.select{|income| income.frequency=="monthly"}.map{|income| income.amount}.sum
    total_income_by_weekly=user.incomes.select{|income| income.frequency=="weekly"}.map{|income| income.amount}.sum
    monthly_to_weekly_income_breakdown=total_income_by_monthly/4

    weekly_income_total = monthly_to_weekly_income_breakdown + total_income_by_weekly

    total_expenses_by_monthly=user.expenses.select{|expense| expense.frequency=="monthly"}.map{|expense| expense.amount}.sum
    total_expenses_by_weekly=user.expenses.select{|expense| expense.frequency=="weekly"}.map{|expense| expense.amount}.sum
    monthly_to_weekly_expenses_breakdown=total_expenses_by_monthly/4

    weekly_expense_total= monthly_to_weekly_expenses_breakdown + total_expenses_by_weekly

    budget= weekly_income_total - weekly_expense_total

    render json:{weekly_budget: budget, weekly_income: weekly_income_total, weekly_expense: weekly_expense_total}
  end

  def all_user_income
    # user=User.find_by(params[:id])

    user = User.first
    all_income=user.incomes

    render json:{all_income: all_income}
  end

  def all_user_expenses

    user = User.first
    all_expenses=user.expenses

    render json:{all_expenses: all_expenses}
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
