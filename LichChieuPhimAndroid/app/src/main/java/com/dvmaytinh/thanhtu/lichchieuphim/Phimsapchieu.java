package com.dvmaytinh.thanhtu.lichchieuphim;

import android.app.Activity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v4.widget.SwipeRefreshLayout;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONException;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;

public class Phimsapchieu extends Activity {
    ListView lvPhim;
    ArrayList<ItemPhimdangchieu> listMockData;
    private SwipeRefreshLayout swipeContainer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_phimsapchieu);

        lvPhim = (ListView) findViewById(R.id.lvsapchieu);

        if (AllConfig.JSONPhimsapchieu==null) {
            new Phimsapchieu.LoadJson().execute(AllConfig.IP_ADDRESS + "/phimsapchieu/phim_sap_chieu.php");
        }
        else {
            try {
                PrintListview(AllConfig.JSONPhimsapchieu);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }


        swipeContainer = (SwipeRefreshLayout) findViewById(R.id.swipeContainer);
        // Setup refresh listener which triggers new data loading
        swipeContainer.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                // Your code to refresh the list here.
                // Make sure you call swipeContainer.setRefreshing(false)
                // once the network request has completed successfully.
                new Phimsapchieu.LoadJson().execute(AllConfig.IP_ADDRESS + "/phimsapchieu/phim_sap_chieu.php");
                fetchTimelineAsync(0);
            }

            private void fetchTimelineAsync(int i) {
            }
        });
        // Configure the refreshing colors
        swipeContainer.setColorSchemeResources(android.R.color.holo_blue_bright,
                android.R.color.holo_green_light,
                android.R.color.holo_orange_light,
                android.R.color.holo_red_light);
    }

    protected void PrintListview(JSONArray json) throws JSONException {
        listMockData = new ArrayList<ItemPhimdangchieu>();
        for(int i=0;i<json.length();i++) {
            Integer id       = Integer.valueOf(json.getJSONObject(i).getString("id"));
            String TenPhim   = json.getJSONObject(i).getString("TenPhim");
            String TheLoai   = json.getJSONObject(i).getString("TheLoai");
            String KhoiChieu = json.getJSONObject(i).getString("KhoiChieu");
            String DienVien  = json.getJSONObject(i).getString("DienVien");
            String HinhAnh   = json.getJSONObject(i).getString("HinhAnh");
            String NoiDung   = json.getJSONObject(i).getString("NoiDung");
            String Rating    = json.getJSONObject(i).getString("Rate");
            Float RatingMV = 0f;
            if (!Rating.equals("null"))
            {
                RatingMV = Float.parseFloat(Rating);
            }

            String ChiTiet = "<b>Khởi chiếu: </b>" + KhoiChieu
                    + "<br><b>Thể loại:</b>" + TheLoai
                    + "<br><b>Diễn viên:</b> " + DienVien;

            ItemPhimdangchieu newsData = new ItemPhimdangchieu();
            newsData.setHinhAnh(HinhAnh);
            newsData.setNoiDung(NoiDung);
            newsData.setChiTiet(ChiTiet);
            newsData.setTenPhim(TenPhim);
            newsData.setRate(RatingMV);
            listMockData.add(newsData);
        }
        lvPhim.setAdapter(new LVphimsapchieuAdapter(Phimsapchieu.this,listMockData));
        lvPhim.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> a, View v, int position, long id) {
                Intent chuyen = new Intent(Phimsapchieu.this,PhimsapchieuNoidung.class);
                chuyen.putExtra("id",position);
                startActivity(chuyen);
            }
        });


    }

    private class LoadJson extends AsyncTask<String, Integer,String>
    {

        @Override
        protected String doInBackground(String... params) {
            return docNoiDung_Tu_URL(params[0]);
        }

        @Override
        protected void onPostExecute(String s) {
            try {
                JSONArray json = AllConfig.JSONPhimsapchieu = new JSONArray(s);
                PrintListview(json);
                swipeContainer.setRefreshing(false);
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