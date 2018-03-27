class APIController < Sinatra::Base

  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  get '/' do
    @title = "Article Index"
    @validation  = ValidationService.new
    @results = ResultsService.new.get_article(0)
    erb :'articles/index'
  end

  get '/:id' do
    id = params[:id].to_i
    @title = "Article Show Page"
    @article = ResultsService.new.get_article(id)
    erb :'articles/show'
  end
end
