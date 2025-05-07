
import requests

def get_lat_lon_google(place_name, api_key="AIzaSyB3y0szjZmNj_w2q9Vnc08ZL_FU6Z4VTFE" ):
    url = f"https://maps.googleapis.com/maps/api/geocode/json?address={place_name}&key={api_key}"
    response = requests.get(url).json()

    if response['status'] == 'OK':
        location = response['results'][0]['geometry']['location']
        return location['lat'], location['lng']
    else:
        return None

