FROM ensemblorg/ensembl-vep
MAINTAINER John Garza <johnegarza@wustl.edu>

LABEL \
    description="Vep helper image"

USER root

RUN mkdir -p /home/vep/Plugins
WORKDIR /home/vep/Plugins
RUN wget https://raw.githubusercontent.com/Ensembl/VEP_plugins/release/90/Downstream.pm
RUN wget https://raw.githubusercontent.com/griffithlab/pVACtools/master/tools/pvacseq/VEP_plugins/Wildtype.pm

COPY add_annotations_to_table_helper.py /usr/bin/add_annotations_to_table_helper.py
COPY docm_and_coding_indel_selection.pl /usr/bin/docm_and_coding_indel_selection.pl

USER vep
