class NotesController < ApplicationController
  def index
    notes = Note.all
      render json: notes
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: @note
  end

  private
  def note_params
    params.require(:note).permit(:title, :body)
  end

end
