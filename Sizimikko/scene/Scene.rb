
#シーンのインターフェース
class SceneIF
    def initialize()

    end
    def update()
        raise NotImplementedError.new("#{self.class}##{__method__} が実装されていません")
    end
    def draw()
        raise NotImplementedError.new("#{self.class}##{__method__} が実装されていません")
    end
end
