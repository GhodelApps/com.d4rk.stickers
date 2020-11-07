package com.d4rk.stickers;
import android.content.Context;
import android.util.AttributeSet;
import androidx.annotation.Nullable;
import androidx.recyclerview.widget.RecyclerView;
import java.util.Objects;
public class BottomFadingRecyclerView extends RecyclerView {
    public BottomFadingRecyclerView(@Nullable Context context) {
        super(Objects.requireNonNull(context));
    }
    public BottomFadingRecyclerView(@Nullable Context context, @Nullable AttributeSet attrs) {
        super(Objects.requireNonNull(context), attrs);
    }
    public BottomFadingRecyclerView(@Nullable Context context, @Nullable AttributeSet attrs, int defStyle) {
        super(Objects.requireNonNull(context), attrs, defStyle);
    }
    @Override
    protected float getTopFadingEdgeStrength() {
        return 0.0f;
    }
}