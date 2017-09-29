package com.dvmaytinh.thanhtu.lichchieuphim;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.RatingBar;
import android.widget.TextView;

import java.util.ArrayList;

/**
 * Created by thanhtulexuan on 12/3/16.
 */

public class LVcommentAdapter extends BaseAdapter {

    private ArrayList<ItemComment> DScm;
    private LayoutInflater layoutInflater;

    public LVcommentAdapter(Context context, ArrayList<ItemComment> DScm) {
        this.DScm = DScm;
        layoutInflater = LayoutInflater.from(context);
    }

    @Override
    public int getCount() {
        return DScm.size();
    }

    @Override
    public Object getItem(int position) {
        return DScm.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }


    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LVcommentAdapter.ViewHolder holder;
        if (convertView == null) {
            convertView = layoutInflater.inflate(R.layout.rowcomment, null);
            holder = new LVcommentAdapter.ViewHolder();
            holder.txtName = (TextView) convertView.findViewById(R.id.lvCMName);
            holder.txtDatetime = (TextView) convertView.findViewById(R.id.lvCMDatetime);
            holder.RB = (RatingBar) convertView.findViewById(R.id.ratingBarLVCM);
            holder.txtComment = (TextView) convertView.findViewById(R.id.lvCMComment);

            convertView.setTag(holder);
        } else {
            holder = (LVcommentAdapter.ViewHolder) convertView.getTag();
        }

        ItemComment newsItem = DScm.get(position);

        holder.txtName.setText(newsItem.getName());
        holder.txtDatetime.setText(newsItem.getDatetime());

        holder.RB.setRating(Float.parseFloat(newsItem.getRate()));
        holder.txtComment.setText(newsItem.getComment());



        return convertView;
    }


    private static class ViewHolder {
        TextView txtName,txtDatetime,txtComment;
        RatingBar RB;
    }





}
