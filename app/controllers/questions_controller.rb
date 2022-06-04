class QuestionsController < ApplicationController
  before_action :set_question_for_current_user, only: %i[update destroy edit hide]
  before_action :ensure_current_user, only: %i[update destroy edit hide]

  def create
    @question = Question.new(create_question_params)
    @question.author = current_user

    if check_captcha(@question) && @question.save
      redirect_to user_path(@question.user), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'При попытке создать вопрос возникли ошибки'
      render :new
    end
  end

  def update
    if @question.update(update_question_params)
      redirect_to user_path(@question.user), notice: 'Вопрос обновлен!'
    else
      flash.now[:alert] = 'При попытке сохранить вопрос возникли ошибки'

      render :edit
    end
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удален!'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.order(created_at: :desc).last(10)
    @users = User.order(created_at: :desc).last(10)
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hide
    @question.toggle!(:hidden)

    redirect_to question_path(@question)
  end

  private

  def check_captcha(model)
    current_user.present? || verify_recaptcha(model: model)
  end

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end

  def create_question_params
    params.require(:question).permit(:body, :user_id, :author_id)
  end

  def update_question_params
    params.require(:question).permit(:body, :answer)
  end
end
