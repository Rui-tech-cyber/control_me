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

  def index
    @period = params[:period].presence || "week"
    @category = params[:category].presence || Entry.categories.keys.first

    base_scope = Entry.where(category: @category)

    @entries = case @period
                when "week"
                  base_scope.where(recorded_at: 6.days.ago.beginning_of_day..Time.current)
                when "month"
                  base_scope.where(recorded_at: Time.current.beginning_of_month..Time.current)
                when "all"
                  base_scope
                else
                  base_scope
                end

      @entries = @entries.order(recorded_at: :desc, created_at: :desc)

      prepare_entries_for_view
      prepare_graph_data
      prepare_recent_memos
    end

  private

  def entry_params
    params.require(:entry).permit(:category, :value)
  end

  def prepare_entries_for_view
    entries_for_list = 
      if @period == "all"
        @entries.limit(100) #直近100件
      else
        @entries
      end

    @entries_by_date = entries_for_list.group_by{ |e| e.recorded_at.to_date }
  end

  def prepare_graph_data
    @unit = Entry::UNIT_MAP[@category]

    @graph_data = case @period
                  when "week", "month"
                    @entries.group(:recorded_at).sum(:value).sort
                  when "all"
                    @entries.group("DATE_TRUNC('month', recorded_at)").sum(:value).sort
                  else
                    {}
                  end
  end

  def prepare_recent_memos
    @recent_memos = Memo.joins(:entry).where(entries: { category: @category }).where.not(body: [nil, ""]).order(update_at: :desc).limit(5)
  end

end
