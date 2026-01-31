class RecordsController < ApplicationController
    protect_from_forgery with: :null_session

    def create
        record = Record.new(record_params)

        if record.save
            render json: {
                status: "ok",
                record: record
            }, status: :created
        else
            render json: {
                status: "error",
                errors: record.errors.full_messages
            }, status: :unprocessable_entity
        end
    end

    private

    def record_params
        params.require(:record).permit(:category, :value, :recorded_on)
    end
end
