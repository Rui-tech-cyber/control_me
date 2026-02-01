class EntriesController < ApplicationController
  def new
    @entry = Entry.new
    @categories = Entry.categories.keys
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.recorded_at = Time.zone.now


    if @entry.save
      redirect_to edit_entry_memo_path(@entry)
    else
      @categories = Entry.categories.keys
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:category, :value)
  end
end
