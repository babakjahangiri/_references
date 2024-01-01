# Gunicorn configs
import logging
import multiprocessing
from logging.handlers import TimedRotatingFileHandler

from app_config import APP_CONFIG

logger = logging.getLogger('gunicorn.error')

log_file = APP_CONFIG.LOG_FILE_PATH

handler = TimedRotatingFileHandler(
    filename=log_file,
    backupCount=APP_CONFIG.LOG_FILE_BACKUP_COUNT,
    when=APP_CONFIG.LOG_TIME_TO_ROTATE,
)
handler.maxBytes = APP_CONFIG.LOG_FILE_MAX_BYTES
formatter = logging.Formatter('%(asctime)s [%(levelname)s] %(message)s')
handler.setFormatter(formatter)

logger.addHandler(handler)
logger.setLevel(level='ERROR')

bind: str = f'0.0.0.0:{APP_CONFIG.APPLICATION_PORT}'
workers: int = multiprocessing.cpu_count() * 2 + 1
worker_class: str = 'uvicorn.workers.UvicornWorker'
worker_connections: int = APP_CONFIG.WORKER_CONNECTIONS
timeout = APP_CONFIG.TIMEOUT
keepalive = 24 * 60 * 60
errorlog = log_file
accesslog = log_file

# How to run it in bash ---> gunicorn main:app -c gunicorn_conf.py