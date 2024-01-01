def create_app() -> FastAPI:
    """
    Create app instance
    """
    try:

        current_app = FastAPI(
            title='****',
            description=description,  # Add the updated description here
            version=APP_CONFIG.VERSION,
            contact=contact,
            debug=APP_CONFIG.DEBUG,
            docs_url=None,
            redoc_url=None,
            openapi_tags=tags_metadata,
        )
        current_app.logger = LOGGER
        return current_app
    except FastAPIError as e:
        LOGGER.error(f'{str(e)}')


app = create_app()