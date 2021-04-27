from datetime import datetime
from chalice import Chalice

app = Chalice(app_name='lambda-cron')
app.debug = True

@app.schedule('cron(* * ? * * *)')
def cron_tab(event):
    print(f"{datetime.now()}: I'm running!")
