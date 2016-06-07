module StaticPagesHelper
    def fname(file)
        ext=fext(file)
        name = file.chomp(ext)
        return name
    end
    
    def fext(file)
    ext=File.extname(file)
    return ext
    end
    
    def mlocation
        path = Dir.pwd
        mypath = path.chomp("/home/ubuntu/container") 
        if mypath==""
            return "Home"
        end
    end
end
