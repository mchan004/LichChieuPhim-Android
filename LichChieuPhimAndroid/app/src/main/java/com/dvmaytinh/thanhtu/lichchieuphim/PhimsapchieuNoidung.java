package com.dvmaytinh.thanhtu.lichchieuphim;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Html;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RatingBar;
import android.widget.TabHost;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.facebook.FacebookSdk;
import com.facebook.appevents.AppEventsLogger;
import com.facebook.share.model.SharePhoto;
import com.facebook.share.model.SharePhotoContent;
import com.facebook.share.widget.ShareButton;
import com.github.paolorotolo.expandableheightlistview.ExpandableHeightListView;
import com.google.android.youtube.player.YouTubeBaseActivity;
import com.google.android.youtube.player.YouTubeInitializationResult;
import com.google.android.youtube.player.YouTubePlayer;
import com.google.android.youtube.player.YouTubePlayerView;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.Target;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class PhimsapchieuNoidung extends YouTubeBaseActivity {
    YouTubePlayerView youTubePlayerView;
    YouTubePlayer.OnInitializedListener onInitializedListener;

    ImageView hinh;
    TextView txtTenMovie,txtNoiDung,txtThongTin;
    int i;
    TabHost tab;


    ExpandableHeightListView lvCM;
    ArrayList<ItemComment> listMockData = new ArrayList<ItemComment>();



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        FacebookSdk.sdkInitialize(getApplicationContext());
        AppEventsLogger.activateApp(this);
        setContentView(R.layout.activity_phimsapchieu_noidung);

        Bundle bd= getIntent().getExtras();
        i=bd.getInt("id");

        txtTenMovie  = (TextView) findViewById(R.id.txtTenMovie);
        txtNoiDung   = (TextView) findViewById(R.id.txtNoiDung);
        txtThongTin  = (TextView) findViewById(R.id.txtThongTin);
        hinh         = (ImageView) findViewById(R.id.hinhanhPhim);
        youTubePlayerView = (YouTubePlayerView) findViewById(R.id.youtube_viewww);
        lvCM = (ExpandableHeightListView) findViewById(R.id.lvComment);


        JSONArray jsons = AllConfig.JSONPhimsapchieu;
        JSONObject json = null;
        try {
            json = jsons.getJSONObject(i);
            final String idPhim = json.getString("id");
            final String TenPhim = json.getString("TenPhim");
            String TheLoai = json.getString("TheLoai");
            String DaoDien = json.getString("DaoDien");
            String Rating = json.getString("Rate");
            Float RatingMV = 0f;
            if (!Rating.equals("null"))
            {
                RatingMV = Float.parseFloat(Rating);
            }
            String KhoiChieu = json.getString("KhoiChieu");
            String DienVien = json.getString("DienVien");
            String Thoiluong = json.getString("ThoiLuong");
            String HinhAnh = json.getString("HinhAnh");
            String NoiDung = json.getString("NoiDung");
            final String Trailer = json.getString("Trailer");
            String TT = "<b>Khởi chiếu: </b>" + KhoiChieu +
                    "<br><b>Thể loại:</b>" + TheLoai
                    +   "<br><b>Diễn viên:</b> " + DienVien
                    +   "<br><b>Đạo diễn:</b> " + DaoDien +
                    "<br><b>Thời lượng:</b>" + Thoiluong
                    +   "<br><b>Đánh giá:</b>";

            RatingBar RTDCND = (RatingBar) findViewById(R.id.RatingDCND);
            RTDCND.setRating(RatingMV);
            txtNoiDung.setText(NoiDung);
            txtTenMovie.setText(TenPhim);
            txtThongTin.setText(Html.fromHtml(TT));
            final Bitmap[] hinhbm = new Bitmap[1];
            Picasso.with(this).load(HinhAnh).into(new Target() {
                @Override
                public void onBitmapLoaded(Bitmap bitmap, Picasso.LoadedFrom from) {
                    hinhbm[0] = bitmap;
                    hinh.setImageBitmap(bitmap);
                }

                @Override
                public void onBitmapFailed(Drawable errorDrawable) {

                }

                @Override
                public void onPrepareLoad(Drawable placeHolderDrawable) {

                }
            });


//Youtube
            onInitializedListener = new YouTubePlayer.OnInitializedListener() {
                @Override
                public void onInitializationSuccess(YouTubePlayer.Provider provider, YouTubePlayer youTubePlayer, boolean b) {
                    youTubePlayer.loadVideo(Trailer);
                }

                @Override
                public void onInitializationFailure(YouTubePlayer.Provider provider, YouTubeInitializationResult youTubeInitializationResult) {

                }
            };
            youTubePlayerView.initialize(AllConfig.YOUTUBE_API_KEY,onInitializedListener);
//ShareFB
            SharePhoto photo = new SharePhoto.Builder()
                    .setBitmap(hinhbm[0])
                    .build();
            SharePhotoContent content = new SharePhotoContent.Builder()
                    .addPhoto(photo)
                    .build();

            ShareButton shareButton = (ShareButton)findViewById(R.id.fb_share_button);
            shareButton.setShareContent(content);

            ///////////////
            ///////////////
            ///////////////
            ////Comment////
            ///////////////
            ///////////////
            ///////////////
            new LoadComment().execute(AllConfig.IP_ADDRESS + "/phimsapchieu/comment.php?id="+idPhim);

            lvCM.setAdapter(new LVcommentAdapter(PhimsapchieuNoidung.this,listMockData));
            lvCM.setExpanded(true);
            Button btnSendCM = (Button) findViewById(R.id.btnSendCM);
            btnSendCM.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {


                    EditText txtTen = (EditText) findViewById(R.id.txtTenCM);
                    EditText txtEmail = (EditText) findViewById(R.id.txtEmailCM);
                    EditText txtComment = (EditText) findViewById(R.id.txtComment);
                    RatingBar rating = (RatingBar) findViewById(R.id.ratingBar);

                    final String TenCM = txtTen.getText().toString().trim();
                    final String EmailCM = txtEmail.getText().toString().trim();
                    final String CommentCM = txtComment.getText().toString().trim();
                    final String RateCM = String.valueOf(rating.getRating());


                    if (TenCM.length()>1 && EmailCM.length()>4 && CommentCM.length()>1) {
                        RequestQueue MyRequestQueue = Volley.newRequestQueue(PhimsapchieuNoidung.this);

                        String url = AllConfig.IP_ADDRESS + "/phimsapchieu/comment_POST.php";
                        StringRequest MyStringRequest = new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                //This code is executed if the server responds, whether or not the response contains data.
                                //The String 'response' contains the server's response.
                                Toast.makeText(PhimsapchieuNoidung.this, response, Toast.LENGTH_SHORT).show();
                                LinearLayout LLComment = (LinearLayout) findViewById(R.id.CManhien);
                                LLComment.setVisibility(View.GONE);
                            }
                        }, new Response.ErrorListener() { //Create an error listener to handle errors appropriately.
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Toast.makeText(PhimsapchieuNoidung.this, error.getMessage(), Toast.LENGTH_SHORT).show();
                            }
                        }) {
                            protected Map<String, String> getParams() {
                                Map<String, String> MyData = new HashMap<String, String>();
                                MyData.put("id", TenPhim);
                                MyData.put("Name", TenCM);
                                MyData.put("Email", EmailCM);
                                MyData.put("Comment", CommentCM);
                                MyData.put("Rate", RateCM);
                                return MyData;
                            }
                        };

                        MyRequestQueue.add(MyStringRequest);

                    }
                    else{
                        Toast.makeText(PhimsapchieuNoidung.this, "Vui lòng nhập đúng nội dung trước khi gởi", Toast.LENGTH_SHORT).show();
                    }


                }
            });




        } catch (JSONException e) {
            e.printStackTrace();
        }







}

        private class LoadComment extends AsyncTask<String, Integer,String>
        {

            @Override
            protected String doInBackground(String... params) {
                return docNoiDung_Tu_URL(params[0]);
            }

            @Override
            protected void onPostExecute(String s) {
                try {
                    JSONArray json = new JSONArray(s);




                    for(int i=0;i<json.length();i++) {
                        Integer id       = Integer.valueOf(json.getJSONObject(i).getString("id"));
                        String Name   = json.getJSONObject(i).getString("Name");
                        String Rate   = json.getJSONObject(i).getString("Rate");
                        String Comment = json.getJSONObject(i).getString("Comment");
                        String Email  = json.getJSONObject(i).getString("Email");
                        String DateCreate = json.getJSONObject(i).getString("DateCreate");

                        ItemComment newsData = new ItemComment();
                        newsData = new ItemComment();
                        newsData.setName(Name);
                        newsData.setDatetime(DateCreate);
                        newsData.setRate(Rate);
                        newsData.setComment(Comment);
                        listMockData.add(newsData);
                    }





                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }
        }


    private static String docNoiDung_Tu_URL(String theUrl)
    {
        StringBuilder content = new StringBuilder();

        try
        {
            // create a url object
            URL url = new URL(theUrl);

            // create a urlconnection object
            URLConnection urlConnection = url.openConnection();

            // wrap the urlconnection in a bufferedreader
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));

            String line;

            // read from the urlconnection via the bufferedreader
            while ((line = bufferedReader.readLine()) != null)
            {
                content.append(line).append("\n");
            }
            bufferedReader.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return content.toString();
    }


}
