class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json
  def index
      @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  # GET /pictures/new
  def new
    if logged_in?.present?
      @picture = Picture.new
    else
      redirect_to new_session_path, notice: "ログインしてください"
    end
  end

  # GET /pictures/1/edit
  def edit
    # @picture = current_user.pictures.build(picture_params)
    if session[:user_id] == @picture.user_id
    else
      redirect_to pictures_path, notice:"自分が投稿した記事以外は編集できません"
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  # POST /pictures
  # POST /pictures.json
  def create
    # if picture_params
    #   @picture = Picture.new(picture_params)
    # else
    #   @picture = Picture
    # end
    @picture = current_user.pictures.build(picture_params)
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)


    respond_to do |format|
      if @picture.save
        PictureMailer.picture_mail(@picture).deliver
        format.html { redirect_to @picture }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: '記事を編集しました。.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    if session[:user_id] == @picture.user_id
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: '記事を削除しました。' }
      format.json { head :no_content }
    end
    else
      redirect_to pictures_path, notice:"自分が投稿した記事以外は削除できません"
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:image,:image_cache,:content)
    end

    def contact_params
      params.require(:picture).permit(:name,:email,:content)
    end
end
