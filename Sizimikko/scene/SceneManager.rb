require_relative  "./Scene.rb"
require_relative  "./title/Title.rb"
require_relative  "./game/Game.rb"


class SceneManager
    private
    @@scene = nil
    @@nextScene = :TITLE

    def initialize
    end

    def self.changeScene()
        case @@nextScene
        when :TITLE
            @@scene = Title.new()
        when :GAME
            @@scene = Game.new()
        when nil

        else
            puts "シーンチェンジにない物を呼び出しています"
        end
        @@nextScene = nil
    end

    public
    def self.init()
        @@nextScene = nil
        @@scene = nil
        self.setNextScene(:TITLE)
    end
    def self.update()
        @@scene.update()
    end

    def self.draw()
        @@scene.draw()
    end
    def self.setNextScene(nextScene)
        @@nextScene = nextScene
    end

end