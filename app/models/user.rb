class User < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  has_many :friendships
  has_many :friends, through: :friendships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def stock_already_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end
  
  def under_stock_limit?
    (user_stocks.count < 10)
  end
  
  def can_add_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_added?(ticker_symbol)
  end

  def full_name
    return   "#{first_name} #{last_name}".strip if first_name || last_name
    "Anonymous"
  end


  def already_friends?(friend_id) 
    friend = friendships.find_by(friend_id: friend_id )
    return false unless friend
    friendships.where(friend_id: friend_id ).exists?
  end

  def self.search(keywords)
    keywords.strip!
    keywords.downcase!
    to_send_back = ((first_name_matches(keywords))+(last_name_matches(keywords))+(email_matches(keywords))).uniq
    return nil unless to_send_back
    to_send_back
  end

  def self.first_name_matches(keywords)
    matches('first_name',keywords)
  end

  def self.last_name_matches(keywords)
    matches("last_name", keywords)
  end

  def self.email_matches(keywords)
    matches('email',keywords)
  end

  def self.matches(field_name,keywords)
    User.where("#{field_name} like ?","%#{keywords}%")
  end
  
end
