module ApiHelper
  def api_helper(id, api, auth_key, client_key)
    @user = User.find(id)

    if api == "yo"
      package = Package.create(api: "Yo", auth_key: auth_key)
      @user.packages << package
      yo_requests(package)
      add_code_snippet
    end
  end

  private

  def yo_requests(package)
    request1 = Request.create(type: "post", name: "yo", url: "https://api.justyo.co/yo/", doc: "send a yo")
    request2 = Request.create(type: "post", name: "yoall", url: "https://api.justyo.co/yoall/", doc: "send a yo to everyone in your contact list")
    package.requests << request1
    package.requests << request2
    @requests = package.requests
  end

  def assign_methods(package)
    Yo.singleton_class.class_eval do
      define_method(:"#{request.name}") do |params|
        post = Net::HTTP.post_form(URI.parse(params[:url]), {"username"=> params[:username], 'api_token'=>params[:api_token]})
      end
    end
  end

  def add_code_snippet
    current_snippet = @user.code_snippet
    requests = []
    @requests.each { |request| requests << request.name }
    new_snippet = "require 'net/http';class Yo;def self.doc;puts 'methods: yo, yoall';end;def self.yo(params);post = Net::HTTP.post_form(URI.parse('https://api.justyo.co/yo/'), {'username'=> params[:username], 'api_token'=>'b33f9516-2d7e-4874-b214-3f5ec8fb59d0'});post;end;def self.yoall(params);post = Net::HTTP.post_form(URI.parse('https://api.justyo.co/yoall/'), {'api_token'=>'b33f9516-2d7e-4874-b214-3f5ec8fb59d0'});post;end;end;"
    current_snippet = current_snippet + new_snippet
    @user.update_attributes(code_snippet: current_snippet)
  end
end
