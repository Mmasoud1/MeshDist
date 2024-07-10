import coinstac
import local as local
import remote as remote

coinstac.start(local.start, remote.start)
