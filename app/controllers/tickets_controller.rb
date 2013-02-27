# coding: utf-8

class TicketsController < ApplicationController

    def index
        @tickets = Ticket.all(:order => "created_at DESC")
    end

    def show
        @ticket = Ticket.find(params[:id])
    end

    def new
        @ticket = Ticket.new
        @extended_fields = [ { :name => :test_field }]
    end

    def create
        @ticket = Ticket.new(params[:ticket])
        if @ticket.save
            redirect_to tickets_path, notice: "新しいチケット『" + @ticket.title + "』が作成されました！"
        else
            render action: "new"
        end
    end

    def edit
        @ticket = Ticket.find(params[:id])
        @extended_fields = [ { :name => :test_field }]
    end

    def update
        @ticket = Ticket.find(params[:id])
        if @ticket.update_attributes(params[:ticket])
            redirect_to tickets_path, notice: "『" + @ticket.title + "』が更新されました！"
        end
    end

    def destroy
        @ticket = Ticket.find(params[:id])
        @ticket.destroy
        redirect_to tickets_path, notice: "『" + @ticket.title + "』が削除されました！"
    end

end
