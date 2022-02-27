load 'user.rb'
module Res
  def connection(routes)
    if routes.nil?
      puts "Нет совпадений для #{self}"
      return
    end

    loop do
      print "Выберите действие для взаимодействия с ресурсами (GET/POST/PUT/DELETE) / q для выхода: "
      interaction = gets.chomp
      break if interaction == "q"

      action = nil

      if interaction == "GET"
        print "Выберите действие (index/show) / q для выхода: "
        action = gets.chomp
        break if action == "q"
      end

      action.nil? ? routes[interaction].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Res

  def initialize
    @posts = []
  end

  def index
    if @posts.empty?
      puts "Здесь пусто!"
    else
      @posts.each_with_index { |post, index|
        puts "Пост #{index}:\n#{post}\n"
      }
    end
  end

  def show
    post = @posts[ask_for_int("Индекс поста")]
    puts post
  end

  def create
    @posts.append(ask_for_string("Что нужно написать?"))
  end

  def update
    post_index = ask_for_int("Выберите пост который необходимо отредактировать")
    puts "Старый пост:\n#{@posts[post_index]}\n"
    @posts[post_index] = ask_for_string("Новый пост\n")
  end

  def destroy
    @posts.delete_at(ask_for_int("Выберите пост который необходимо удалить"))
  end
end

class CommentsController
  extend Res

  def initialize
    @comments = []
  end

  def index
    if @comments.empty?
      puts "Здесь пусто!"
    else
      @comments.each_with_index { |post, index|
        puts "Комментарий #{index}:\n#{post}\n"
      }
    end
  end

  def show
    post = @comments[ask_for_int("Индекс комментария")]
    puts post
  end

  def create
    @comments.append(ask_for_string("Что нужно написать?"))
  end

  def update
    post_index = ask_for_int("Выберите пост который необходимо отредактировать")
    puts "Старый пост:\n#{@comments[post_index]}\n"
    @comments[post_index] = ask_for_string("Новый пост\n")
  end

  def destroy
    @comments.delete_at(ask_for_int("Выберите комментарий для удаления"))
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, "posts")
    resources(CommentsController, "comments")

    loop do
      print "Выберите ресурс для взаимодействия (1 - Posts, 2 - Comments, q - для выхода): "
      choise = gets.chomp

      PostsController.connection(@routes["posts"]) if choise == "1"
      CommentsController.connection(@routes["comments"]) if choise == "2"
      break if choise == "q"
    end

    puts "До свидания!"
  end

  def resources(class1, keyword)
    controller = class1.new
    @routes[keyword] = {
      "GET" => {
        "index" => controller.method(:index),
        "show" => controller.method(:show)
      },
      "POST" => controller.method(:create),
      "PUT" => controller.method(:update),
      "DELETE" => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
