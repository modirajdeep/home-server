class BrowseController < ApplicationController
   def home
      if logged_in?
         if params[:f]==nil
            @userpath = params[:to]
            @browse = Browse.new
            
         else
            render 'open'
         end
      else
         redirect_to root_url
      end
   end
   
   def search
   end
   
   def refresh
      redirect_to :back
   end
   
   def back
      redirect_to request.env["HTTP_REFERER"]
   end
   
   def upload
      begin
      @browse = current_user.browses.new(file_params)
      if @browse.save
         flash[:success] = "File Uploaded."
      else
         flash[:danger] = "Some Error Occured"
      end
      rescue CarrierWave::IntegrityError
         flash[:danger] = "Invalid File Type"
      end
    refresh
   end
   
   def fcreate
      begin
      Dir.chdir(cookies[:curpath]) do
         Dir.mkdir(params[:n])
      end
      flash[:info] = "Folder created"
      redirect_to :back
      
      rescue Errno::EEXIST
      flash[:danger] = "Folder name exists"
      refresh
      end
   end

  private

   def file_params
     if params[:browse].present?
      params.require(:browse).permit(:file)
     end
   end
   
   

end