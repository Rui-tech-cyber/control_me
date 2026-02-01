class MemoController < ApplicationController
  before_action :set_entry

  def edit
    @memo = @entry.memo || @entry.build_memo
  end

  def update
    @memo = @entry.memo || @entry.build_memo
    if @memo.update(memo_params)
      redirect_to root_path, notice: "メモを保存しました"
    else
      render :edit
    end
  end

  private

  def set_entry
    @entry = Entry.find(params[:entry_id])
  end

  def memo_params
    params.require(:memo).permit(:content)
  end
end
