class FramesController < ApplicationController
   # GET /frames.json
  def index

    @story = Story.find(params[:story_id])

    @frames = @story.frames

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @frames }
    end
  end

  # GET /frames/1
  # GET /frames/1.json
  def show
    @frame = Frame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @frame }
    end
  end

  # GET /frames/new
  # GET /frames/new.json
  def new
    @story = Story.find(params[:story_id])
    @frame = @story.frames.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @frame }
    end
  end

  # GET /frames/1/edit
  def edit
    #@story = Story.find(params[:story_id])

    @frame = Frame.find(params[:id])
    # @frame = Frame.find(params[:id])
  end

  # POST /frames
  # POST /frames.json
  def create
    @frame = Frame.new(params[:frame])

    if @frame.save
      respond_to do |format|
        format.html {
          render :json => [@frame.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@frame.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /frames/1
  # PUT /frames/1.json
  def update

    @story = Story.find(params[:story_id])

    @frame = @story.frames.find(params[:id])

    respond_to do |format|
      if @frame.update_attributes(frame_params)
        format.html { redirect_to story_path(@story), notice: 'Frame was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /frames/1
  # DELETE /frames/1.json
  def destroy
    #@story = Story.find(params[:story_id])
    #@frame = @story.frames.find(params[:id])
    @frame = Frame.find(params[:id])
    @frame.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def make_default
    @frame = Frame.find(params[:id])
    @story = Story.find(params[:story_id])

    @story.cover = @frame.id
    @story.save

    respond_to do |format|
      format.js
    end
  end

  private

  def frame_params
    params.require(:frame).permit(:description, :story_id, :image)
  end
end
