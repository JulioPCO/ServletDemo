package packagefolder;

public class Video {
    private String name;
    private String url;
    private Long duration;

    public Video(String name,String url,Long duration){
        this.setName(name);
        this.setUrl(url);
        this.setDuration(duration);
    }

    public Long getDuration() {
        return duration;
    }

    public void setDuration(Long duration) {
        this.duration = duration;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString(){
        return "video [ name: " + name + ", url: " + url + ", duration: " + duration +"]";
    }

}
