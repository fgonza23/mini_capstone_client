class Client::ProductsController < ApplicationController
  def index
    response = HTTP.get("http://localhost:3000/api/products")
    @products = response.parse
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                     Name: params["name"],
                     Price: params["price"],
                     Description: params["description"]
                      }
    response = HTTP.post(
                        "http://localhost:3000/api/products",
                        form: client_params
                        )
    @product = response.parse
    redirect_to "/client/products/#{@recipe["id"]}"
  end

  def show
    response = HTTP.get("http://localhost:3000/api/products/#{params[:id]}")
    @product = response.parse
    render 'show.html.erb'
  end

  def edit
    response = HTTP.get("http://localhost:3000/api/products/#{params[:id]}")
     @product = response.parse
    render 'edit.html.erb'
  end

  def update
    client_params = {
                     Name: params["name"],
                     Price: params["price"],
                     Description: params["description"]
                      }
    response = HTTP.patch(
                        "http://localhost:3000/api/products/#{params[:id]}",
                        form: client_params
                          )
    @product = response.parse
    redirect_to "/client/products/#{@product["id"]}"
  end

  def destroy
    HTTP.delete("http://localhost:3000/api/products/#{params[:id]}")
    redirect_to "/client/products"
  end
end
