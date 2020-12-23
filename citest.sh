echo "Loading";
cd /root/ci-cd-demo/;
echo "有趣事物\r" >> /root/ci-cd-demo/README.md;
git add .;
git commit -m "有趣事务";
git push;
