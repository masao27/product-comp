class ProductsController < ApplicationController
  def index
  end

  def search
    #ラジオボタン初期化
    radiobtn_init

    @items  = []
    @keyword = params[:keyword]
    #送られてきたキーワードが空ではないか確認してして、大丈夫ならajax_hatsudoメソッドを呼び出します。
    #Yahooの商品情報取得
    httpclient_yahoo if @keyword.present?
    #楽天の商品情報取得
    ajax_rakuten if @keyword.present? 
  
    if @items.size > 1 then
      #検索結果をDBに格納
      cleate_prod_db(@items)
      #データベースから検索結果を取得
      get_prod_db
      @view_cnt = true
      @noitem_message = ""
    end

    if (@view_cnt.nil?) && (@keyword.nil?) then
      @noitem_message = ""
    end

    if (!@view_cnt.nil?) && (@keyword.nil?) then
      @noitem_message = ""
    end

    if (@view_cnt.nil?) && (!@keyword.nil?) then
      @noitem_message = "該当する商品は存在しません。"
    end

    if (!@view_cnt.nil?) && (!@keyword.nil?) then
      @noitem_message = "該当する商品は存在しません。"
    end

  end

  # 表示条件選択ラジオボタンの表示設定 
  def radiobtn_init
    case params[:order_radio]
    when "0"
      @oradio1=true
      @oradio2=false
      @oradio3=false
    when "1"
      @oradio1=false
      @oradio2=true
      @oradio3=false
    when "2"
      @oradio1=false
      @oradio2=false
      @oradio3=true
    else
      @oradio1=true
      @oradio2=false
      @oradio3=false
    end

    case params[:count_radio]
    when "10"
      @cradio1=true
      @cradio2=false
      @cradio3=false
    when "30"
      @cradio1=false
      @cradio2=true
      @cradio3=false
    when "50"
      @cradio1=false
      @cradio2=false
      @cradio3=true
    else
      @cradio1=false
      @cradio2=false
      @cradio3=true
    end
  end

  #Yahooの商品情報APIをHttpclientで取得Gemです。
  def httpclient_yahoo
    yahoohclient = YahooKeyphraseService.new(params[:keyword])
    @items << yahoohclient.execute
    return @items
  end

  #楽天の商品情報をajaxで取得Gemです。
  def ajax_rakuten
    items           = []
    item_array      = []
    result_hash     = []

    # 楽天商品情報取得gemを使用し、Ajaxでリクエスト、Jsonで受け取る
    items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword],hits: 30)
 
    items.each do |tmp_item|
      item_array = {Name: "#{tmp_item['itemName']}", Description: "#{tmp_item['itemCaption']}", StoreName: "#{tmp_item['shopName']}",StoreUrl: "#{tmp_item['itemUrl']}", Image: "#{tmp_item['mediumImageUrls'][0]}"  ,Price: "#{tmp_item.price}"}
      @items.push(item_array)
      @items.flatten!
    end
    return @items
  end

  # DB登録
  def cleate_prod_db(itemsdb)
    Product.delete_all
    itemsdb.each do |item|
      Product.create(prodname: "#{item[:Name]}", description: "#{item[:Description]}", storename: "#{item[:StoreName]}", storeurl: "#{item[:StoreUrl]}",  imageurl: "#{item[:Image]}", price: "#{item[:Price]}".to_i)
    end
  end

  # 表示選択
  def get_prod_db
    case params[:order_radio]
      when "0" then   #並び変え条件指定なし
        @products = Product.page(params[:page]).per(params[:count_radio].to_i)
      when "1" then   #安い順
        @products = Product.page(params[:page]).per(params[:count_radio].to_i).order("price ASC")
      when "2" then   #高い順
        @products = Product.page(params[:page]).per(params[:count_radio].to_i).order("price DESC")      
      else
        @products = Product.page(params[:page]).per(params[:count_radio].to_i)      
    end
  end
end
