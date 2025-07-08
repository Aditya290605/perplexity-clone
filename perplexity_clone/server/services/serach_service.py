from config import Settings


settings = Settings()
class SearchService:
    def web_search(self,query:str):
        return settings.TAVILY_API_KEY