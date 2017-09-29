package com.dvmaytinh.thanhtu.lichchieuphim;

import android.content.Context;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;

/**
 * Created by thanhtulexuan on 11/22/16.
 */

public class LVphimsapchieuAdapter extends BaseAdapter {

    private ArrayList<ItemPhimdangchieu> dsphim;
    private LayoutInflater layoutInflater;

    public LVphimsapchieuAdapter(Context context, ArrayList<ItemPhimdangchieu> dsphim) {
        this.dsphim = dsphim;
        layoutInflater = LayoutInflater.from(context);
    }

    @Override
    public int getCount() {
        return dsphim.size();
    }

    @Override
    public Object getItem(int position) {
        return dsphim.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;
        if (convertView == null) {
            convertView = layoutInflater.inflate(R.layout.rowsapchieu, null);
            holder = new ViewHolder();
            holder.txtTenphim = (TextView) convertView.findViewById(R.id.txtTenphim);
            holder.txtChiTiet = (TextView) convertView.findViewById(R.id.txtChiTiet);
            holder.txtNoidung = (TextView) convertView.findViewById(R.id.txtNoiDung);
            holder.imageView = (ImageView) convertView.findViewById(R.id.hinhanhPhim);
            holder.RTB = (RatingBar) convertView.findViewById(R.id.ratingBarLVDC);
            holder.txtTenphim.setMaxLines(4);
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }

        ItemPhimdangchieu newsItem = dsphim.get(position);

        holder.txtTenphim.setText(newsItem.getTenPhim());
        holder.txtNoidung.setText(newsItem.getNoiDung());
        holder.txtChiTiet.setText(Html.fromHtml(newsItem.getChiTiet()));
        holder.RTB.setRating(newsItem.getRate());
        Picasso.with(layoutInflater.getContext()).load(newsItem.getHinhAnh()).into(holder.imageView);


        return convertView;
    }

    static class ViewHolder {
        TextView txtTenphim,txtNoidung,txtChiTiet;
        RatingBar RTB;
        ImageView imageView;
    }


}