class Admin::AuthoritiesController < ApplicationController
  before_action :is_admin_accessible
  before_action :set_authority, only: [:show, :edit, :update, :destroy]
  layout 'admin_layout'

  # GET /authorities
  def index
    @authorities = Authority.all
  end

  # GET /authorities/1
  def show
  end

  # GET /authorities/new
  def new
    @authority = Authority.new
  end

  # GET /authorities/1/edit
  def edit
  end

  # POST /authorities
  def create
    @authority = Authority.new(authority_params)

    if @authority.save
      redirect_to admin_authority_path(@authority), notice: 'Authority was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /authorities/1
  def update
    if @authority.update(authority_params)
      redirect_to admin_authority_path(@authority), notice: 'Authority was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /authorities/1
  def destroy
    @authority.destroy
    redirect_to admin_authorities_url, notice: 'Authority was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authority
      @authority = Authority.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def authority_params
      params.require(:authority).permit(:name)
    end
end
