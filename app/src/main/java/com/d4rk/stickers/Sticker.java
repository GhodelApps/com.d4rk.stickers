package com.d4rk.stickers;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.List;
class Sticker implements Parcelable {
    final String imageFileName;
    final List < String > emojis;
    long size;
    Sticker(String imageFileName, List < String > emojis) {
        this.imageFileName = imageFileName;
        this.emojis = emojis;
    }
    private Sticker(Parcel in ) {
        imageFileName = in .readString();
        emojis = in .createStringArrayList();
        size = in .readLong();
    }
    public static final Creator < Sticker > CREATOR = new Creator < Sticker > () {
        @Override
        public Sticker createFromParcel(Parcel in ) {
            return new Sticker( in );
        }
        @Override
        public Sticker[] newArray(int size) {
            return new Sticker[size];
        }
    };
    public void setSize(long size) {
        this.size = size;
    }
    @Override
    public int describeContents() {
        return 0;
    }
    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(imageFileName);
        dest.writeStringList(emojis);
        dest.writeLong(size);
    }
}