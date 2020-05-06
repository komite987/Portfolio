class PortfoliosController < ApplicationController
	before_action :set_portfolio, only:[:edit, :update, :show, :destroy]
	layout "portfolio"
  access all: [:show, :index, :angular, :rails], user: {except: [:destroy, :new, :edit, :update, :create, :sort]},
        site_admin: :all

	def index
		@portfolio_items = Portfolio.by_position
	end

	def sort
		params[:order].each do |key, value|
			Portfolio.find(value[:id]).update(position: value[:position])
		end
		head :ok
	end

	def angular
		@portfolio_items = Portfolio.angular
	end

	def rails
		@portfolio_items = Portfolio.Ruby_on_rails
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)
	    respond_to do |format|
	      if @portfolio_item.save
	        format.html { redirect_to portfolio_show_path(@portfolio_item),
	        							notice: 'Portfolio item was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end
	end

	def edit
	end

	def update
		respond_to do |format|
	      if @portfolio_item.update(portfolio_params)
	        format.html { redirect_to portfolio_show_path(@portfolio_item),
	        							notice: 'Portfolio item was successfully updated.' }
	      else
	        format.html { render :edit }
	      end
    	end
	end



	  def show
	  end

	  def destroy
	  	
	    @portfolio_item.destroy
	    respond_to do |format|
	      format.html { redirect_to portfolios_path, notice: 'Item was successfully destroyed.' }
	    end
	  end


private 
	def portfolio_params
		params.require(:portfolio).permit(:title,
																			:subtitle,
																			:body,
																			:main_img,
																			:thumb_img,
																			technologies_attributes: [:id, :name, :_destroy])
	end

	def set_portfolio
		@portfolio_item = Portfolio.find(params[:id])
	end

end
