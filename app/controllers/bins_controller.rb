class BinsController < ApplicationController
  def new
  end

  def index
  end

  def show
    @items = {}
    Bin.all.where('user_id = ?', params[:id]).each do |item|
      this = Item.find(item.item_id)
      @items[this.id] = { name: this.name, price: this.price, amount: item.amount }
    end
  end

  def add
    if Bin.exists?(user_id: current_user.id, item_id: params[:item_id])
      bin = Bin.find_by(user_id: current_user.id, item_id: params[:item_id])
      bin.amount += params[:item][:amount].to_i
    else
      bin = Bin.new(user_id: current_user.id, item_id: params[:item_id], amount: params[:item][:amount])
    end

    if bin.save
      item = Item.find(params[:item_id])
      item.amount -= params[:item][:amount].to_i
      item.save
    end

    redirect_to('/bins/' + current_user.id.to_s)
  end
end