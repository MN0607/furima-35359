class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    # AS導入に伴い記述。merge等追加必要。
    params.require(:item).permit(:image)
  end
end
