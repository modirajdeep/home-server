module BrowseHelper
    
    def browse(to, search)
      if search == nil
      if to == nil
        path="/home/ubuntu/workspace/public/container"
        uploadPath = "container"
      else
        path="/home/ubuntu/workspace/public/container/"+to
        uploadPath = "container/"+to
      end
      
      @uploadPath = uploadPath
      user = User.find(current_user.id)
      user.update_attribute(:uploadPath, uploadPath)
      
      if Dir.exists? path
        @sanepath = true
        Dir.chdir(path) do
          @files = Dir.glob("*.*")
          folder = Dir.glob("*")
          @folders = folder - @files
          @path = Dir.pwd
          cookies[:curpath] = @path
        end
      else
          @sanepath = false
          flash[:danger] = "You seem to have a broken link!"
          redirect_to root_url
      end
      
      else
        @searching = true
        @files = []
        @folders = []
      end
    end
    
    def pathSplit(path)
        if path == nil
            ret = ["Home"]
        else
            ret = path.split('/')
            ret.insert(0,"Home")
        end
        return ret
    end
    
    def pathLink(path,goto)
        if path == nil || goto == "Home"
            ret = browse_url
        else
            point = path =~ Regexp.union(goto)
            len = goto.length
            point = point.to_i + len
            y = path.first(point)
            ret = params.merge(to: y)
        end
        return ret
    end
    
    def linkOf(prev,fwd)
        if prev == nil
            return fwd
        else
        return prev+"/"+fwd
        end
    end
    
    def fileSystemPath(pathTo)
        if pathTo == nil
            return "container"
        else
            return "container/"+pathTo
        end
    end
end

